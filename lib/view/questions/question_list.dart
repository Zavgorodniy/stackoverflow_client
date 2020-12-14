import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_client/bloc/base_state.dart';
import 'package:stackoverflow_client/data/model/question.dart';
import 'package:stackoverflow_client/utils/srings.dart';
import 'package:stackoverflow_client/view/base/pagination_manager.dart';
import 'package:stackoverflow_client/view/questions/block/questions_cubit.dart';
import 'package:stackoverflow_client/view/questions/widgets/question_list_item.dart';

class QuestionList extends StatefulWidget {
  final String tag;

  const QuestionList(this.tag, {Key key}) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> with PaginationManager {
  @override
  Widget build(BuildContext context) => BlocProvider<QuestionsCubit>(
        create: (context) => QuestionsCubit(widget.tag),
        child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.questionsTitle),
          ),
          body: BlocBuilder<QuestionsCubit, BaseListState<Question>>(
            buildWhen: (previousState, state) =>
                previousState.data.length != state.data.length,
            builder: (context, state) {
              final bloc = context.watch<QuestionsCubit>();
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) =>
                    onScroll(scrollInfo, bloc.getData),
                child: state.data != null
                    ? ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.data.length,
                        itemBuilder: (_, i) => QuestionListItem(state.data[i]),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      )
                    : CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
}
